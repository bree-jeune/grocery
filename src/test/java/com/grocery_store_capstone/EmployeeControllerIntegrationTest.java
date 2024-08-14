package com.grocery_store_capstone;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import com.grocery_store_capstone.database.entity.Employee;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.boot.test.web.server.LocalServerPort;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.web.client.HttpClientErrorException;

import java.util.Arrays;
import java.util.List;

@ExtendWith(SpringExtension.class)
@SpringBootTest(classes = GroceryStoreCapstoneApplication.class, webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class EmployeeControllerIntegrationTest {

	@LocalServerPort
	private int port;

	@Autowired
	private TestRestTemplate restTemplate;

	private String getRootUrl() {
		return "http://localhost:" + port;
	}

	@Test
	public void testGetAllEmployees() {
		HttpHeaders headers = new HttpHeaders();
		HttpEntity<String> entity = new HttpEntity<>(null, headers);
		ResponseEntity<String> response = restTemplate.exchange(getRootUrl() + "/employees",
				HttpMethod.GET, entity, String.class);

		assertNotNull(response.getBody());
	}

	@Test
	public void testGetEmployeeById() {
		ResponseEntity<Employee> response = restTemplate.getForEntity("/api/employee/1", Employee.class);
		assertEquals(HttpStatus.OK, response.getStatusCode());
		assertNotNull(response.getBody());
	}

	@Test
	public void testCreateEmployee() {
		Employee employee = new Employee();
		employee.setName("John Doe");
		employee.setPosition("Developer");

		ResponseEntity<Employee> response = restTemplate.postForEntity("/api/employee", employee, Employee.class);
		assertEquals(HttpStatus.CREATED, response.getStatusCode());
		assertNotNull(response.getBody());
	}
	@Test
	public void testUpdateEmployee() {
		int id = 1;
		Employee employee = restTemplate.getForObject(getRootUrl() + "/employees/" + id, Employee.class);
		employee.setFirstName("John");
		employee.setLastName("Doe Updated");

		restTemplate.put(getRootUrl() + "/employees/" + id, employee);

		Employee updatedEmployee = restTemplate.getForObject(getRootUrl() + "/employees/" + id, Employee.class);
		assertNotNull(updatedEmployee);
	}

	@Test
	public void testDeleteEmployee() {
		int id = 2;
		Employee employee = restTemplate.getForObject(getRootUrl() + "/employees/" + id, Employee.class);
		assertNotNull(employee);

		restTemplate.delete(getRootUrl() + "/employees/" + id);

		try {
			employee = restTemplate.getForObject(getRootUrl() + "/employees/" + id, Employee.class);
		} catch (final HttpClientErrorException e) {
			assertEquals(HttpStatus.NOT_FOUND, e.getStatusCode());
		}
	}

	@Test
	public void testLambdaExample() {
		List<String> names = Arrays.asList("John", "Jane", "Doe");
		names.forEach(name -> System.out.println("Hello, " + name));
	}

}
